package org.springframework.ntfh.cardtest;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.ntfh.entity.character.Character;
import org.springframework.ntfh.entity.character.CharacterService;
import org.springframework.ntfh.entity.enemy.Enemy;
import org.springframework.ntfh.entity.enemy.EnemyService;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngameService;
import org.springframework.ntfh.entity.game.Game;
import org.springframework.ntfh.entity.game.GameService;
import org.springframework.ntfh.entity.game.GameStateType;
import org.springframework.ntfh.entity.playablecard.abilitycard.AbilityCard;
import org.springframework.ntfh.entity.playablecard.abilitycard.AbilityCardService;
import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngame;
import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngameService;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.ntfh.entity.turn.Turn;
import org.springframework.ntfh.entity.turn.TurnService;
import org.springframework.ntfh.entity.turn.TurnState;
import org.springframework.ntfh.entity.turn.TurnStateType;
import org.springframework.ntfh.entity.user.User;
import org.springframework.ntfh.entity.user.UserService;
import org.springframework.ntfh.util.State;
import org.springframework.ntfh.util.TokenUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;

@DirtiesContext(classMode = ClassMode.AFTER_CLASS)
@DataJpaTest(
		includeFilters = {@ComponentScan.Filter(Service.class), @ComponentScan.Filter(State.class)})
@Import({BCryptPasswordEncoder.class})
public class RangerCardTest {
    
    @Autowired
	private GameService gameService;

	@Autowired
	private TurnService turnService;

	@Autowired
	private UserService userService;

	@Autowired
	private CharacterService characterService;

	@Autowired
	private AbilityCardIngameService abilityCardIngameService;

	@Autowired
	private EnemyService enemyService;

	@Autowired
	private EnemyIngameService enemyIngameService;

	@Autowired
	private AbilityCardService abilityCardService;

	protected Game gameTester;

	protected Player ranger;

	protected Player rogue;

	protected EnemyIngame enemyIngame;

	protected EnemyIngame berserkerIngame;

	@BeforeEach
	public void init() {
		gameTester = new Game();
		gameTester.setName("test game");
		gameTester.setHasScenes(false);
		gameTester.setSpectatorsAllowed(false);
		gameTester.setMaxPlayers(2);
		gameTester.setStateType(GameStateType.LOBBY);
		gameTester = gameService.save(gameTester);

		User user1 = userService.findUser("user1");
		User user2 = userService.findUser("user2");

		gameTester = gameService.joinGame(gameTester, user1); // first player -> leader
		gameTester = gameService.joinGame(gameTester, user2);

		ranger = gameTester.getPlayers().get(0);
		rogue = gameTester.getPlayers().get(1);

		Character rangerCharacter = characterService.findById(2);
		Character rogueCharacter = characterService.findById(4);

		ranger.setCharacter(rangerCharacter);
		rogue.setCharacter(rogueCharacter);

		gameService.startGame(gameTester.getId());
		Enemy SLINGER = enemyService.findEnemyById(12).get();
		enemyIngame = enemyIngameService.createFromEnemy(SLINGER, gameTester);
        Enemy BERSERKER = enemyService.findEnemyById(15).get();
        berserkerIngame = enemyIngameService.createFromEnemy(BERSERKER, gameTester);
	}

	@AfterEach
	public void teardown() {
		gameService.delete(gameTester);
	}

	@Test
	void testCompaneroLobo(){
		
		AbilityCard companeroLobo = abilityCardService.findById(1);
        AbilityCardIngame abilityCardIngameRanger =
                abilityCardIngameService.createFromAbilityCard(companeroLobo, ranger);
        String tokenRanger = TokenUtils.generateJWTToken(ranger.getUser());
        List<AbilityCardIngame> hand = new ArrayList<>();
        hand.add(abilityCardIngameRanger);
        ranger.setHand(hand);
        abilityCardIngameService.playCard(abilityCardIngameRanger.getId(),
                berserkerIngame.getId(), tokenRanger);
        
        assertThat(berserkerIngame.getCurrentEndurance()).isEqualTo(4);
		assertThat(ranger.getGuard()).isEqualTo(2);
	}
    
	@Test
	void disparoCertero(){

		Integer gameId = gameTester.getId();
		Turn initialTurn = gameService.getCurrentTurnByGameId(gameId);
		TurnStateType initialTurnState = initialTurn.getStateType();

		AbilityCard disparoCertero = abilityCardService.findById(2);
        AbilityCardIngame abilityCardIngameRanger =
                abilityCardIngameService.createFromAbilityCard(disparoCertero, ranger);
        String tokenRanger = TokenUtils.generateJWTToken(ranger.getUser());
        List<AbilityCardIngame> hand = new ArrayList<>();
        hand.add(abilityCardIngameRanger);
        ranger.setHand(hand);
        abilityCardIngameService.playCard(abilityCardIngameRanger.getId(),
                berserkerIngame.getId(), tokenRanger);
        
        assertThat(berserkerIngame.getCurrentEndurance()).isEqualTo(3);
		assertThat(initialTurn.getStateType()).isNotEqualTo(initialTurnState); //the game has changed from player phase to market phase
		
	}
}
