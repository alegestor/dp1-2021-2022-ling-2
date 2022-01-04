package org.springframework.ntfh.cardlogic.abilitycard.ranger;

import org.springframework.ntfh.command.DealDamageCommand;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;

/**
 * Daño: 3
 * Pierdes 1 carta. Finaliza el ataque.
 * 
 * @author Pablosancval
 */
@Component
public class DisparoCertero {
    public void execute(Player playerFrom, EnemyIngame targetedEnemy) {
        new DealDamageCommand(3, targetedEnemy).execute();
        // TODO comando de fin de ataque
    }
}
