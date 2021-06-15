package com.one.whospet.service.shop.face;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Service
public class IamportService {

	private String test_api_key = "4450228238398137";
	private String test_api_secret = "idpOJ9JdBfiPua6P1uKSD8AxudysWfqetQ3dZMqB2JrxTxmU26NGfndKALdw1DLuuOHuB75EQwbK4xF7";
	private IamportClient client;

	public IamportService() {
		client = new IamportClient(test_api_key,test_api_secret);
	}
	
	public String getToken() {
		String token = null;
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			token = auth_response.getResponse().getToken();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		return token;
	}
	
	public String cancel(CancelData cancel_data) {
		// 조회 먼저 하고 
		// 있는지 확인하는 if로직 
		// 있으면 
		String result = null;
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
			result = payment_response.getMessage(); // 이미 취소된 거래는 response가 null이다
			System.out.println(result);
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


	
}
