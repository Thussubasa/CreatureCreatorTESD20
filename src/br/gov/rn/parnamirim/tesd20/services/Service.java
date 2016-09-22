package br.gov.rn.parnamirim.tesd20.services;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import br.gov.rn.parnamirim.tesd20.dao.NpcDAO;
import br.gov.rn.parnamirim.tesd20.models.Npc;

@Path("/")
public class Service {
	private NpcDAO npcDao = new NpcDAO();	
	
	@Path("/npcs")
	@GET
	@Produces("application/json")
	public Response listarNpcs() {
		return Response.ok().entity(npcDao.listar()).build();
	}
	
	@Path("/npcs")
	@POST
	@Consumes("application/json")
	public Response inserir(Npc npc) {
		return Response.ok().entity(npcDao.inserir(npc)).build();
	}
	
	
}
