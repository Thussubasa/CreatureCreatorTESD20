package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tes_d20.role")
public class Role {

	@Id
	@GeneratedValue
	private long id;
	@Column(name="nome")
	private String nome;

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
	
}
