package com.mp.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.ticket.dao.MovefieldTicketInvoiceDao;
import com.mp.ticket.entity.MovefieldTicketInvoice;

@Service
@Transactional
public class MovefieldTicketInvoiceService {
	@Autowired
	private MovefieldTicketInvoiceDao movefieldTicketInvoiceDao;
	public MovefieldTicketInvoice selectOne(String sno) {
		try {
			return movefieldTicketInvoiceDao.selectByPrimaryKey(sno);
		} catch (Exception e) {
			return null;
		}

	}
}
