package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.Orders;

@Repository
@Transactional
public class OrderDao {

	@Autowired
	private EntityManager entityManager;

//    private DataSource dataSource;
//    private JdbcTemplate jdbcTemplate;
//
//    public DataSource getDataSource() {
//        return dataSource;
//    }
//
//    @Autowired
//    public void setDataSource(DataSource dataSource) {
//        this.dataSource = dataSource;
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
//    }

	public String getOrderNo() {
//        String sql = "select max(oid) from orders";

		String sql = "Select max(e.oid) " //
				+ " from " + Orders.class.getName() + " e ";

		Query query = entityManager.createQuery(sql, Integer.class);

		String orderId = null;

//        String orderId = jdbcTemplate.queryForObject(sql, String.class);
		if (query.getSingleResult() == null) {
			orderId = "1";
		} else {
			orderId = String.valueOf((Integer) query.getSingleResult() + 1);
		}

		return orderId;
	}

	@SuppressWarnings("unchecked")
	public List<Orders> getAllOrders() {
		String sql = "Select new " + Orders.class.getName() //
				+ "(e.oid, e.cid, e.total, e.orderType, e.orderDate) " //
				+ " from " + Orders.class.getName() + " e " + " order by e.orderDate desc";

		Query query = entityManager.createQuery(sql, Orders.class);
		return query.getResultList();
	}

//	private static class OrderMapper implements RowMapper<Orders> {
//
//		@Override
//		public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Orders o = new Orders();
//			o.setOid(rs.getInt("oid"));
//			o.setCid(rs.getInt("cid"));
//			o.setTotal(rs.getDouble("total"));
//			o.setOrderType(rs.getString("orderType"));
//			o.setOrderDate(rs.getDate("orderDate"));
//			return o;
//		}
//
//	}

	public void saveOrder(Orders orders) {
		entityManager.persist(orders);
	}
}
