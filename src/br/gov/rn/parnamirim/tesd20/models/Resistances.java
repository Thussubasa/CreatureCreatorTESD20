package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tes_d20.resistances")
public class Resistances {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	
	@Column(name="poison_resistance")
	private Integer poisonResistance;
	
	@Column(name="disease_resistance")
	private Integer diseaseResistance;
	
	@Column(name="frost_resistance")
	private Integer frostResistance;
	
	@Column(name="fire_resistance")
	private Integer fireResistance;
	
	@Column(name="magic_resistance")
	private Integer magicResistance;
	
	
	public Integer getPoisonResistance() {
		return poisonResistance;
	}

	public void setPoisonResistance(Integer poisonResistance) {
		this.poisonResistance = poisonResistance;
	}
	

	public Integer getDiseaseResistance() {
		return diseaseResistance;
	}

	public void setDiseaseResistance(Integer diseaseResistance) {
		this.diseaseResistance = diseaseResistance;
	}
	
	public Integer getFrostResistance() {
		return frostResistance;
	}

	public void setFrostResistance(Integer frostResistance) {
		this.frostResistance = frostResistance;
	}
	
	public Integer getfireResistance() {
		return fireResistance;
	}

	public void setFireResistance(Integer fireResistance) {
		this.fireResistance = fireResistance;
	}
	
	public Integer getMagicResistance() {
		return magicResistance;
	}

	public void setMagicResistance(Integer magicResistance) {
		this.magicResistance = magicResistance;
	}

	
	
}
