<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="#"> <img src="template/images/icon/logo.png"
			alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li class="active has-sub">
					<a class="js-arrow" href="#"> 
						<i class="fas fa-tachometer-alt"></i>
						Dashboard
					</a>
						<ul class="list-unstyled navbar__sub-list js-sub-list">
							<li><a href="index.html">Dashboard 1</a></li>
						</ul>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/products"><i class="fas fa-chart-bar"></i> Product</a>
				</li>
				<li>
					<a href="<%= request.getContextPath()%>/customers"><i class="fas fa-chart-bar"></i> Customer</a>
				</li>
				<li>
					<a href="chart.html"> <i class="fas fa-chart-bar"></i>Charts</a>
				</li>
			</ul>
		</nav>
	</div>
</aside>