package com.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.location.Location;

public interface LocationRepository extends JpaRepository<Location, Integer>{

}
