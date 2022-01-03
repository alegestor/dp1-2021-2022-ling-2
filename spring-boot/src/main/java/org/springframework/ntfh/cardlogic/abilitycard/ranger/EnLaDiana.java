package org.springframework.ntfh.cardlogic.abilitycard.ranger;

import org.springframework.ntfh.command.DealDamageCommand;
import org.springframework.ntfh.command.DiscardCommand;
import org.springframework.ntfh.command.GetGloryCommand;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;


@Component
public class EnLaDiana {
    public void execute(Player playerFrom, EnemyIngame targetedEnemy){
        new DealDamageCommand(4, targetedEnemy).execute();
        new GetGloryCommand(1, playerFrom).execute();
        new DiscardCommand(1, playerFrom).execute();
    }
}
