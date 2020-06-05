//Functions Device
#include <avr/io.h>
#include <avr/interrupt.h>

// Standard Input/Output functions
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include <main.h>
#include <net.h>
#include <enc28j60.h>
#include <ip_arp_udp_tcp.h>
#include "web.h"

static uint8_t g_webBuffer[BUFFER_SIZE + 1];
static _Bool g_status = TRUE;

uint16_t PrintWebpage(uint8_t* buf)
{
	uint16_t plen = Fill_tcp_data_p(
	    buf, 0, PSTR("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"));
	plen = Fill_tcp_data_p(
	    buf, plen, PSTR("<center><h1>Web Controlled Relay<hr>"));

	const char http_start[] = "<a href=\"http://";

	if(g_status) {
		TURN_ON_RELAY;
		plen = Fill_tcp_data(buf, plen, http_start);
		plen = Fill_tcp_data(buf, plen, SRT_IP_ADDR);
		plen = Fill_tcp_data(buf, plen, "/REL_1\">TURN OFF THE RELAY</a><hr>");

	} else {
		TURN_OFF_RELAY;
		plen = Fill_tcp_data(buf, plen, http_start);
		plen = Fill_tcp_data(buf, plen, SRT_IP_ADDR);
		plen = Fill_tcp_data(buf, plen, "/REL_0\">TURN ON THE RELAY</a><hr>");
	}

	return plen;
}

//*****************************************************************************

void LanTask()
{
	uint16_t plen, dat_p = 0;
	_Bool send;

	for(;;) {
		plen = Enc28j60PacketReceive(BUFFER_SIZE, g_webBuffer);
		/*plen will unequal to zero if there is a valid packet (without crc error) */
		if(plen == 0) return;

		// arp is broadcast if unknown but a host may also verify the mac address by sending it to a unicast address.
		if(Eth_type_is_arp_and_my_ip(g_webBuffer, plen)) {
			Make_arp_answer_from_request(g_webBuffer);
			continue;
		}
		// check if the ip packet is for us:
		if(Eth_type_is_ip_and_my_ip(g_webBuffer, plen) == 0) {
			continue;
		}
		// ping
		if((g_webBuffer[IP_PROTO_P] == IP_PROTO_ICMP_V) &&
		   (g_webBuffer[ICMP_TYPE_P] == ICMP_TYPE_ECHOREQUEST_V)) {
			Make_echo_reply_from_request(g_webBuffer, plen);
			continue;
		}

		// tcp port www start, compare only the lower byte
		if((g_webBuffer[IP_PROTO_P] == IP_PROTO_TCP_V) &&
		   (g_webBuffer[TCP_DST_PORT_H_P] == 0) &&
		   (g_webBuffer[TCP_DST_PORT_L_P] == TCP_PORT)) {
			if(g_webBuffer[TCP_FLAGS_P] & TCP_FLAGS_SYN_V) {
				// make_tcp_synack_from_syn does already send the syn,ack
				Make_tcp_synack_from_syn(g_webBuffer);
				continue;
			}
			if(g_webBuffer[TCP_FLAGS_P] & TCP_FLAGS_ACK_V) {
				Init_len_info(g_webBuffer); // init some data structures
				dat_p = Get_tcp_data_pointer();
				if(dat_p == 0) {
					// we can possibly have no data, just ack:
					if(g_webBuffer[TCP_FLAGS_P] & TCP_FLAGS_FIN_V) {
						Make_tcp_ack_from_any(g_webBuffer);
					}
					continue;
				}
			}
			send = FALSE;
			if(strncmp("GET ", (char*)&(g_webBuffer[dat_p]), 4) != 0) {
				// head, post and other methods for possible status codes see:
				// http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
				plen = Fill_tcp_data_p(
				    g_webBuffer,
				    0,
				    PSTR(
				        "HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n<h1>200 OK</h1>"));
				send = TRUE;
			}

			if(!send) {
				// start of incomming payload
				char* p = (char*)&(g_webBuffer[dat_p + 4]);
				if(strncmp("/REL_1", p, 6) == 0) {
					g_status = FALSE;
				} else if(strncmp("/REL_0", p, 6) == 0) {
					g_status = TRUE;
				}

				plen = PrintWebpage(g_webBuffer);
				send = TRUE;
			}

			Make_tcp_ack_from_any(g_webBuffer);        // send ack for http get
			Make_tcp_ack_with_data(g_webBuffer, plen); // send data
		}

		// udp interface:
		if(g_webBuffer[IP_PROTO_P] == IP_PROTO_UDP_V) {
			uint8_t payloadlen = g_webBuffer[UDP_LEN_L_P] - UDP_HEADER_LEN;
			// the received command has to start with t and be 4 char long
			// e.g "test\0"
			if(payloadlen) {
			}
		} // End udp interface.
	}
}
