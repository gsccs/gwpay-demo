package com.allinpay.gw.demo.controller;

import java.net.HttpURLConnection;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allinpay.ets.client.PaymentResult;
import com.allinpay.ets.client.SecurityUtil;
import com.allinpay.ets.client.StringUtil;


/**
 * 订单查询
 * @author x.d zhang
 *
 */
@Controller
public class OrderQueryController {


	@RequestMapping(value = "/query/one", method = RequestMethod.GET)
	protected String queryOrderOne(HttpServletRequest req) {
		return "demo/oneOrderQuery_req";
	}

	@RequestMapping(value = "/query/one", method = RequestMethod.POST)
	public String postQueryOne(
			HttpServletRequest request, ModelMap map) {
		String signSrc="";
		String serverUrl=request.getParameter("serverUrl");
		String key=request.getParameter("key");
		String merchantId=request.getParameter("merchantId");	
		String version=request.getParameter("version");
		String signType=request.getParameter("signType");
		String orderNo=request.getParameter("orderNo");
		String orderDatetime=request.getParameter("orderDatetime");
		String queryDatetime=request.getParameter("queryDatetime");
		
		StringBuffer bufSignSrc=new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId",merchantId);
		StringUtil.appendSignPara(bufSignSrc, "version", version);
		StringUtil.appendSignPara(bufSignSrc, "signType", signType);
		StringUtil.appendSignPara(bufSignSrc, "orderNo", orderNo);
		StringUtil.appendSignPara(bufSignSrc, "orderDatetime",orderDatetime);
		StringUtil.appendSignPara(bufSignSrc, "queryDatetime",queryDatetime);
		StringUtil.appendLastSignPara(bufSignSrc, "key", key);
		signSrc=bufSignSrc.toString();
		String sign= SecurityUtil.MD5Encode(bufSignSrc.toString());
		
		map.put("merchantId", merchantId);
		map.put("version", version);
		map.put("signType", signType);
		map.put("orderNo", orderNo);
		map.put("orderDatetime", orderDatetime);
		map.put("queryDatetime", queryDatetime);
		map.put("serverUrl", serverUrl);
		map.put("signSrc", signSrc);
		map.put("sign", sign);
		return "demo/oneOrderQuery";
	}
	
	
	@RequestMapping(value = "/query/one/result", method = RequestMethod.POST)
	public String postQueryOneResult(
			HttpServletRequest request, ModelMap map) {
		
		String serverUrl=request.getParameter("serverUrl");
		String key=request.getParameter("key");
		String merchantId=request.getParameter("merchantId");	
		String version=request.getParameter("version");
		String signType=request.getParameter("signType");
		String orderNo=request.getParameter("orderNo");
		String orderDatetime=request.getParameter("orderDatetime");
		String queryDatetime=request.getParameter("queryDatetime");
		String signMsg=request.getParameter("signMsg");
	
		// 提交查询请求
		boolean isSuccess = false;
		String resultMsg = "";
		Map<String, String> result = new HashMap<String, String>();
		try{
			String listenUrl=serverUrl;
			HttpClient httpclient=new HttpClient();
			PostMethod postmethod=new PostMethod(listenUrl);
			NameValuePair[] date = { new NameValuePair("merchantId",merchantId),
					new NameValuePair("version",version),
					new NameValuePair("signType",signType),
					new NameValuePair("orderNo",orderNo),
					new NameValuePair("orderDatetime",orderDatetime),
					new NameValuePair("queryDatetime",queryDatetime),
					new NameValuePair("signMsg",signMsg)};
			postmethod.setRequestBody(date);
			int responseCode=httpclient.executeMethod(postmethod);
			//out.print("responseCode="+responseCode);		
			
			if(responseCode == HttpURLConnection.HTTP_OK){
				String strResponse = postmethod.getResponseBodyAsString();
				
				// 解析查询返回结果
				strResponse = URLDecoder.decode(strResponse);
			//	Map<String, String> result = new HashMap<String, String>();
				String[] parameters = strResponse.split("&");
				for (int i = 0; i < parameters.length; i++) {
					String msg = parameters[i];
					int index = msg.indexOf('=');
					if (index > 0) {
						String name = msg.substring(0, index);
						String value = msg.substring(index + 1);
						result.put(name, value);
					}
				}
		
				// 查询结果会以Server方式通知商户(同支付返回)；
				// 若无法取得Server通知结果，可以通过解析查询返回结果，更新订单状态(参考如下).
				if (null != result.get("ERRORCODE")) {
					// 未查询到订单
					System.out.println("ERRORCODE=" + result.get("ERRORCODE"));
					System.out.println("ERRORMSG=" + result.get("ERRORMSG"));
					resultMsg = result.get("ERRORMSG");
				} else {
					// 查询到订单
					String payResult = result.get("payResult");
					if (payResult.equals("1")) {
						System.out.println("订单付款成功！");
		
						// 支付成功，验证签名
						PaymentResult paymentResult = new PaymentResult();
						paymentResult.setMerchantId(result.get("merchantId"));
						paymentResult.setVersion(result.get("version"));
						paymentResult.setLanguage(result.get("language"));
						paymentResult.setSignType(result.get("signType"));
						paymentResult.setPayType(result.get("payType"));
						paymentResult.setIssuerId(result.get("issuerId"));
						paymentResult.setPaymentOrderId(result
								.get("paymentOrderId"));
						paymentResult.setOrderNo(result.get("orderNo"));
						paymentResult.setOrderDatetime(result
								.get("orderDatetime"));
						paymentResult.setOrderAmount(result.get("orderAmount"));
						paymentResult.setPayAmount(result.get("payAmount"));
						paymentResult.setPayDatetime(result.get("payDatetime"));
						paymentResult.setExt1(result.get("ext1"));
						paymentResult.setExt2(result.get("ext2"));
						paymentResult.setPayResult(result.get("payResult"));
						paymentResult.setErrorCode(result.get("errorCode"));
						paymentResult.setReturnDatetime(result
								.get("returnDatetime"));
						paymentResult.setKey(key);
						paymentResult.setSignMsg(result.get("signMsg"));
						paymentResult.setCertPath("d:\\cert\\TLCert-test.cer");
		
						boolean verifyResult = paymentResult.verify();
		
						if (verifyResult) {
							System.out.println("验签成功！商户更新订单状态。");
							resultMsg = "订单支付成功，验签成功！商户更新订单状态。";
							isSuccess = true;
						} else {
							System.out.println("验签失败！");
							resultMsg = "订单支付成功，验签失败！";
						}
						map.put("paymentResult", paymentResult);	
					} else {
							System.out.println("订单尚未付款！");
							resultMsg = "订单尚未付款！";
					}
				}
		
			}
			
			map.put("isSuccess", isSuccess);
			map.put("resultMsg", resultMsg);
			map.put("merchantId", merchantId);
			
		}catch(Exception e){
		 	e.printStackTrace();
		}
		return "demo/oneOrderQueryResult";
	}
}
