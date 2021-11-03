package com.web.entity.location;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.web.entity.player.Player;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="LOCATION")
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Location {

	@Id
	private int locIdx = 0;
	
	@Column(nullable = false, length = 16)
	private String locName = "첫 번째 마을";
	private int locChar = 1;
	private int locFront = 1;
	private int locBack = 0;
	
	@OneToMany(mappedBy="location", fetch = FetchType.EAGER)
	private Set<Player> player;	
	
	public Location(int locIdx) {
		this.locIdx = locIdx;
		this.locName = "첫 번째 마을";
		this.locChar = 1;
		this.locFront = 1;
		this.locBack = 0;
	}

	public Location(int locIdx, String locName, int locChar, int locFront, int locBack) {
		super();
		this.locIdx = locIdx;
		this.locName = locName;
		this.locChar = locChar;
		this.locFront = locFront;
		this.locBack = locBack;
	}

	
}
