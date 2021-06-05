package com.iti;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement

public class Order {

	 int order_id; 
	 
	 String status;   
	 String date;
	 String exp_date;
	

	public String getexp_date() {
		return exp_date;
	}

	public void setexp_date(String expected_delivery_date) {
		this.exp_date = expected_delivery_date;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	 public Order getOrderById(int id){
		 DataBase db = new DataBase();
		 db.connect();
		   Order order = new Order();
		   try {
			ResultSet rs = db.select("select * from orders where id ='"+id+"';");
			
			if(rs.next()) {
				order.setOrder_id(id);
				order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date")); 
                order.setexp_date(rs.getString("exp_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   db.disconnect();
		   return order;
	   }

}
