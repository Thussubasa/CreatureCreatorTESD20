package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.criteria.CriteriaBuilder.In;


@Entity
@Table(name="tes_d20.npc")
public class Npc {

	
	@Id
	@GeneratedValue
	private long id;
	
	@OneToOne( optional = false, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name="atributo_id")
	private Atributos atributos;
	
	@ManyToOne
	@JoinColumn(name="race_id")
	private Race race;
	
	@ManyToOne
	@JoinColumn(name="treino_id")
	private Treino treino;
	
	@ManyToOne
	@JoinColumn(name="intelligence_id")
	private Intelligence intelligence;
	
	@ManyToOne	
	@JoinColumn(name="role_id")
	private Role role;
	
	@OneToOne( optional = false, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name="resistance_id")
	private Resistances resistances;
	
	@Column(name="level")
	private Integer level;
	
	@Column(name="damage_reduction")
	private Integer damageReduction;
	
	@Column(name="dodge")
	private Integer dodge;
	
	@Column(name="speed")
	private Integer speed;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Atributos getAtributos(){
		return atributos;	
	}
	
	public void setAtributos(Atributos atributos){
		this.atributos = atributos;
	}
	
	public Race getRace(){
		return race;
	}
	
	public void setRace(Race race){
		this.race = race;
	}
	
	public Treino getTreino(){
		return treino;
	}
	
	public void setTreino(Treino treino){
		this.treino = treino;
	}
	
	public Intelligence getIntelligence(){
		return intelligence;
	}
	
	public void setIntelligence(Intelligence intelligence){
		this.intelligence = intelligence;
	}
	
	public Role getRole(){
		return role;
	}
	
	public void role(Role role){
		this.role = role;
	}
	
	public Resistances getResistences(){
		return resistances;
	}
	
	public void setResistences(Resistances resistance){
		this.resistances = resistance;
	}
	
	public Integer getLvl(){
		return level;	
	}
	
	public void setLevel(Integer level){
		this.level = level;
	}
	
	public Integer setSpeed(){
		return speed;	
	}
	
	public void setSpeed(Integer speed){
		this.speed = speed ;
	}
	
	public Integer getDodge(){
		return dodge;	
	}
	
	public void setDodge(Integer dodge){
		this.dodge = dodge;
	}
	
}
