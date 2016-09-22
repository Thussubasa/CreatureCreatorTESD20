package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="tes_d20.atributo")
public class Atributos {
	
	@Id
	@GeneratedValue
	private long id;
	
	@OneToOne(cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name="health_id")
	private Health health;
	
	@OneToOne( cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name="magicka_id")
	private Magicka magicka;
	
	@OneToOne(cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name="stamina_id")
	private Stamina stamina;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Health getHelth(){
		return health; 
	}
	
	public void setHealth(Health health) {
		this.health = health;
	}
	
	public Magicka getMagicka(){
		return magicka; 
	}
	
	public void setMagicka(Magicka magicka) {
		this.magicka = magicka;
	}
	
	public Stamina getStamina(){
		return stamina; 
	}
	
	public void setStamina(Stamina stamina) {
		this.stamina = stamina;
	}
	

}
