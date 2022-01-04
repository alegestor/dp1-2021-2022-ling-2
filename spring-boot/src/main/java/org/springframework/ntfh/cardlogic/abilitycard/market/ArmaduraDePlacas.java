package org.springframework.ntfh.cardlogic.abilitycard.market;

import java.util.Iterator;

import org.springframework.ntfh.command.RecoverCommand;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.ntfh.entity.proficiency.Proficiency;
import org.springframework.ntfh.entity.proficiency.ProficiencyTypeEnum;
import org.springframework.stereotype.Component;

/**
 * Daño: -
 * Modificador: Melee
 * Recuperas 4 cartas
 * 
 * @author Pablosancval
 */
@Component
public class ArmaduraDePlacas {
    public void execute(Player playerFrom) {
        // TODO replace iterator
        Iterator<Proficiency> iterador = playerFrom.getCharacterType().getProficiencies().iterator();
        while (iterador.hasNext()) {
            ProficiencyTypeEnum tipo = iterador.next().getProficiencyTypeEnum();
            if (tipo.equals(ProficiencyTypeEnum.MELEE)) {
                new RecoverCommand(4, playerFrom).execute();
            }
        }
    }
}
