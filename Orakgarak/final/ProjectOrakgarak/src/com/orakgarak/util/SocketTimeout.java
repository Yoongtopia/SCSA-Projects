package com.orakgarak.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.UnknownHostException;



public class SocketTimeout {

	
	public static void main(String[] args) {
	
		try{
			InetAddress addr = InetAddress.getByName("127.0.0.1");
			int port = 8080;
			
			SocketAddress sockaddr = new InetSocketAddress(addr, port);
			
			//Creates an unconnected socket
			Socket socket = new Socket();
			int timeout=5000;
			
			socket.connect(sockaddr, timeout);
			System.out.println("Socket connected..." + socket);
			
			
			
			
		}catch(UnknownHostException e){
			System.out.println("Host not found: "+ e.getMessage());
		}catch (IOException ioe){
			System.out.println("I/O Error"+ ioe.getMessage());
		}
			
	}
}
