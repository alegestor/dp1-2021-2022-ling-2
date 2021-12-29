package org.springframework.ntfh.command;

import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngame;
import org.springframework.ntfh.entity.player.Player;

import lombok.AllArgsConstructor;

import java.util.List;

@AllArgsConstructor
public class DrawCommand implements Command{

    private Integer amount;
    private Player playerFrom;

    @Override
    public void execute() {
        Integer i = 0;
        for(i=0; i<amount; i++){
            List<AbilityCardIngame> listAbilityPile = playerFrom.getAbilityPile();
            AbilityCardIngame discardedCard = listAbilityPile.get(0);
            listAbilityPile.remove(0);
            List<AbilityCardIngame> listHand = playerFrom.getHand();
            listHand.add(discardedCard);
            
            playerFrom.setAbilityPile(listAbilityPile);
            playerFrom.setDiscardPile(listHand);
        }
    }
    
}
