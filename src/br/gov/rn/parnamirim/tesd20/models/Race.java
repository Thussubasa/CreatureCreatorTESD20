package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tes_d20.race")
public class Race {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	@Column(name="nome")
	private String nome;
	@Column(name="base_speed")
	private Integer baseSpeed;
	@Column(name="type")
	private String type;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="nome")
	public String getNome(){
		return nome; 
	}
	
	public void setNome(String nome){
		this.nome = nome;	
	}
	
	public Integer getBaseSpeed(){
		return baseSpeed;
		
	}
	
	public void setBaseSpeed(Integer baseSpeed){
		this.baseSpeed = baseSpeed;	
	}
	
	public String getType(){
		return type; 
	}
	
	public void setType(String type){
		this.type = type;	
	}
	
	
}
