package br.gov.rn.parnamirim.tesd20.config;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import br.gov.rn.parnamirim.tesd20.models.Atributos;
import br.gov.rn.parnamirim.tesd20.models.Health;
import br.gov.rn.parnamirim.tesd20.models.Intelligence;
import br.gov.rn.parnamirim.tesd20.models.Magicka;
import br.gov.rn.parnamirim.tesd20.models.Npc;
import br.gov.rn.parnamirim.tesd20.models.Race;
import br.gov.rn.parnamirim.tesd20.models.Resistances;
import br.gov.rn.parnamirim.tesd20.models.Role;
import br.gov.rn.parnamirim.tesd20.models.Stamina;
import br.gov.rn.parnamirim.tesd20.models.Treino;


public class Hibernate {

    private static Hibernate me;
    private Configuration cfg;
    private SessionFactory sessionFactory;

    @SuppressWarnings("deprecation")
	private Hibernate() throws HibernateException {
        cfg = new Configuration();

        cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        cfg.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");

        cfg.setProperty("hibernate.connection.url", "jdbc:postgresql://localhost:5432/CreatureCreator");
        cfg.setProperty("hibernate.connection.username", "postgres");
        cfg.setProperty("hibernate.connection.password", "postgres");
        
        cfg.addAnnotatedClass(Atributos.class);
        cfg.addAnnotatedClass(Health.class);
        cfg.addAnnotatedClass(Intelligence.class);
        cfg.addAnnotatedClass(Magicka.class);
        cfg.addAnnotatedClass(Npc.class);
        cfg.addAnnotatedClass(Race.class);
        cfg.addAnnotatedClass(Resistances.class);
        cfg.addAnnotatedClass(Stamina.class);
        cfg.addAnnotatedClass(Treino.class);
        cfg.addAnnotatedClass(Role.class);
        
        sessionFactory = cfg.buildSessionFactory();
    }

    public static synchronized Hibernate getInstance() throws HibernateException {
        if (me == null) {
            me = new Hibernate();
        }

        return me;
    }

    public Session getSession() throws HibernateException {
        Session session = sessionFactory.openSession();
        if (!session.isConnected()) {
            this.reconnect();
        }
        return session;
    }

    @SuppressWarnings("deprecation")
	private void reconnect() throws HibernateException {
        this.sessionFactory = cfg.buildSessionFactory();
    }
}