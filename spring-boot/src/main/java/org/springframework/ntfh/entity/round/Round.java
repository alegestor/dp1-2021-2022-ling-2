package org.springframework.ntfh.entity.round;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.ntfh.entity.game.Game;
import org.springframework.ntfh.entity.model.BaseEntity;
import org.springframework.ntfh.entity.scene.Scene;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Round extends BaseEntity {

    @OneToOne(optional = false)
    @JoinColumn(name = "game_id")
    private Game game;

    private Integer roundNumber;

    @ManyToOne(optional = true)
    @JoinColumn(name = "scene_id")
    private Scene currentScene;
}