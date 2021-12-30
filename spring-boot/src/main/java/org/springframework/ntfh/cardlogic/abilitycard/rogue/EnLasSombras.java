package org.springframework.ntfh.cardlogic.abilitycard.rogue;

import org.springframework.ntfh.command.DealDamageCommand;
import org.springframework.ntfh.command.GetGuardCommand;
import org.springframework.ntfh.command.PlayedCommand;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngame;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;


@Component
public class EnLasSombras {
    public void execute(Player playerFrom, EnemyIngame targetedEnemy, AbilityCardIngame cardPlayed){
        new DealDamageCommand(1, targetedEnemy).execute();
        new GetGuardCommand(2, playerFrom).execute();
        new PlayedCommand(playerFrom, cardPlayed).execute();
    }
}
