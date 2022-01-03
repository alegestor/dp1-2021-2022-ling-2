package org.springframework.ntfh.cardlogic.abilitycard.wizard;

import org.springframework.ntfh.command.DealDamageCommand;
import org.springframework.ntfh.command.DrawCommand;
import org.springframework.ntfh.command.RestrainCommand;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;


@Component
public class DisparoGelido {
    public void execute(Player playerFrom, EnemyIngame targetedEnemy){
        new DealDamageCommand(1, targetedEnemy).execute();
        new DrawCommand(1, playerFrom).execute();
        new RestrainCommand(targetedEnemy).execute();
    }
    
}