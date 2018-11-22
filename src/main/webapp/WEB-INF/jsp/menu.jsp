<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="<%= request.getContextPath()%>/">
			<h3 style="color: #ff4dd2;">Perfect Perfume</h3>
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li class="active has-sub">
					<a class="js-arrow" href="<%= request.getContextPath()%>/"> 
						<i class="fas fa-tachometer-alt"></i>
						Dashboard
					</a>
						<ul class="list-unstyled navbar__sub-list js-sub-list">
							<li><a href="index.html">Dashboard 1</a></li>
						</ul>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/products"><i class="fas fa-truck"></i> Product</a>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/customers"><i class="fa fa-users"></i> Customer</a>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/order_detail"><i class="fas fa-chart-bar"></i> Order Detail</a>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/order_add"><i class="fas fa-shopping-cart"></i> Add Order</a>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/logout"><i class="fas fa-arrow-circle-left"></i> LogOut</a>
				</li>
			</ul>
		</nav>
	</div>
</aside>