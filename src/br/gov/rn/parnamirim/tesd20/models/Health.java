package br.gov.rn.parnamirim.tesd20.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tes_d20.health")
public class Health {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	@Column(name="inicial")
	private Integer inicial;
	@Column(name="level")
	private Integer level;
	@Column(name="total")
	private Integer total;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getInicial(){
		return inicial;
	}
	
	public void setInicial(Integer inicial){
		this.inicial = inicial;
	}

	public Integer getlevel(){
		return level;
	}
	
	public void setlevel(Integer level){
		this.level = level;
	}
	public Integer getTotal(){
		return total;
	}
	
	public void setTotal(Integer total){
		this.total = total;
	}

}
