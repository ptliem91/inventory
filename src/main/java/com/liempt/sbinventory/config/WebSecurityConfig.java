package com.liempt.sbinventory.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.liempt.sbinventory.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable();

		http.authorizeRequests() //
				.antMatchers("/", "/logout").permitAll();

		http.authorizeRequests() //
				.antMatchers("/home", "/products", "/customers", "/order_detail", "/address").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		
		http.authorizeRequests() //
		.antMatchers("/order_add").access("hasAnyRole('ROLE_ADMIN')");

		http.formLogin() //
				.loginProcessingUrl("/loginCheck")
				.loginPage("/") //
				.usernameParameter("userName") //
				.passwordParameter("password") //
				.defaultSuccessUrl("/home") //
				.failureUrl("/loginFailed");

		//Logout
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/");

		http.exceptionHandling() //
				.accessDeniedPage("/403"); //

	}
}
