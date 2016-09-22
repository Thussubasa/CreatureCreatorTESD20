package br.gov.rn.parnamirim.tesd20.dao;

import org.hibernate.Session;

import br.gov.rn.parnamirim.tesd20.config.Hibernate;

public class DAO {
	protected Session getHibernateSession(){
		return Hibernate.getInstance().getSession();
	}
}