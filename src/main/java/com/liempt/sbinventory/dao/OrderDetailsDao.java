package com.liempt.sbinventory.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.liempt.sbinventory.entity.OrderDetails;

@Repository
@Transactional
public class OrderDetailsDao {

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

	@SuppressWarnings("unchecked")
	public List<OrderDetails> getAllOrderDetails() {
		String sql = "Select new " + OrderDetails.class.getName() //
				+ "(e.odid, e.oid, e.pid, e.price, e.qty) " //
				+ " from " + OrderDetails.class.getName() + " e ";

		Query query = entityManager.createQuery(sql, OrderDetails.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<OrderDetails> getAllOrderDetailsByOrderID(int oid) {
		String sql = "Select new " + OrderDetails.class.getName() //
				+ "(e.odid, e.oid, e.pid, e.price, e.qty) " //
				+ " from " + OrderDetails.class.getName() + " e " + " where oid = ? ";

		Query query = entityManager.createQuery(sql, OrderDetails.class);
		query.setParameter(0, oid);

		return query.getResultList();
	}

//	private static class ODRowMapper implements RowMapper<OrderDetails> {
//
//		@Override
//		public OrderDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
//			OrderDetails o = new OrderDetails();
//			o.setOdid(rs.getInt("odid"));
//			o.setOid(rs.getInt("oid"));
//			o.setPid(rs.getInt("pid"));
//			o.setPrice(rs.getDouble("price"));
//			o.setQty(rs.getInt("qty"));
//			return o;
//		}
//
//	}

	public void saveOrderDetails(OrderDetails orderDetails) {
		entityManager.persist(orderDetails);
	}

}
