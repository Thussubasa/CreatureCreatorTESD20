package br.gov.rn.parnamirim.tesd20.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Transaction;

import br.gov.rn.parnamirim.tesd20.models.Npc;

public class NpcDAO extends DAO{

	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<Npc> listar() {
		List<Npc> npcs = new ArrayList<Npc>();

		Session session = null;

		try {
			session = getHibernateSession();

			npcs = session.createQuery("FROM Npc").list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return npcs;
	}
	
	public Npc inserir(Npc npc) {
		Session session = null;

		try {
			session = getHibernateSession();

			transaction = session.beginTransaction();

			session.save(npc);

			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.close();
		}
		return npc;
	}
	
	
}
