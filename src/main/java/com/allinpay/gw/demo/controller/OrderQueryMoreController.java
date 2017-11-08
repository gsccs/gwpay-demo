package com.allinpay.gw.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allinpay.ets.client.SecurityUtil;
import com.allinpay.ets.client.StringUtil;


/**
 * 订单查询
 * @author x.d zhang
 *
 */
@Controller
public class OrderQueryMoreController {

	
	@RequestMapping(value = "/query/more", method = RequestMethod.GET)
	protected String queryOrderMore(HttpServletRequest req) {
		return "demo/batchOrderQuery";
	}


	@RequestMapping(value = "/query/more", method = RequestMethod.POST)
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
	
	
	@RequestMapping(value = "/query/more/result", method = RequestMethod.POST)
	public String postQueryOneResult(
			HttpServletRequest request, ModelMap map) {
		
		
		return "demo/oneOrderQueryResult";
	}
}
