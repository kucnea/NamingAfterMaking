package com.web.repository.use;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.support.QueryDslRepositorySupport;
import org.springframework.stereotype.Repository;

import com.web.entity.player.Player;
import com.web.repository.CustomPlayerRepository;

@Repository
public class PlayerRepository extends QueryDslRepositorySupport implements CustomPlayerRepository {

	@PersistenceContext
	EntityManager em;
	
	public PlayerRepository() { super(Player.class); }

	@Override
	public List<Player> findById(String pId) {

		String jpql = "select m from Player as m where m.pId = :pId";
		List<Player> resultList = em.createQuery(jpql, Player.class)
				.setParameter("pId", pId)
				.getResultList();
		
		
		
		return null;
	}


	@Override
	public List<Player> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Player> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Player> findAll(Iterable<Integer> ids) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public <S extends Player> List<S> save(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void flush() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public <S extends Player> S saveAndFlush(S entity) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void deleteInBatch(Iterable<Player> entities) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteAllInBatch() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Player getOne(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Page<Player> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public <S extends Player> S save(S entity) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Player findOne(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean exists(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Player entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Iterable<? extends Player> entities) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

}
