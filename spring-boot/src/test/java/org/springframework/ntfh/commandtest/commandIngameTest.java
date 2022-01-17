package org.springframework.ntfh.commandtest;


import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.mockito.internal.util.collections.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ntfh.entity.character.CharacterService;
import org.springframework.ntfh.entity.enemy.EnemyService;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngameService;
import org.springframework.ntfh.entity.game.Game;
import org.springframework.ntfh.entity.game.GameRepository;
import org.springframework.ntfh.entity.game.GameService;
import org.springframework.ntfh.entity.lobby.Lobby;
import org.springframework.ntfh.entity.lobby.LobbyService;
import org.springframework.ntfh.entity.playablecard.abilitycard.AbilityCardService;
import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngameService;
import org.springframework.ntfh.entity.playablecard.marketcard.MarketCardService;
import org.springframework.ntfh.entity.playablecard.marketcard.ingame.MarketCardIngameService;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.ntfh.entity.turn.TurnService;
import org.springframework.ntfh.entity.user.User;
import org.springframework.ntfh.entity.user.UserService;

public class commandIngameTest {
    
    @Autowired
    private GameService gameService;

    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private LobbyService lobbyService;

    @Autowired
    private UserService userService;

    @Autowired
    private CharacterService characterService;

    @Autowired
    private MarketCardService marketCardService;

    @Autowired
    private MarketCardIngameService marketCardIngameService;

    @Autowired
    private TurnService turnService;

    @Autowired
    private AbilityCardIngameService abilityCardIngameService;

    @Autowired
    private EnemyService enemyService;

    @Autowired
    private EnemyIngameService enemyIngameService;

    @Autowired
    private AbilityCardService abilityCardService;

    private Game gameTester;

    protected Lobby lobbyTester;

    private Player playerTester;

    private Integer INITIAL_GAMES_COUNT = 3;

    @BeforeEach
    public void init() {
        User user1 = userService.findUser("user1");
        User user2 = userService.findUser("user2");
        Set<User> users = Sets.newSet(user1, user2);

        lobbyTester = new Lobby();
        lobbyTester.setName("Init lobby");
        lobbyTester.setHasScenes(true);
        lobbyTester.setSpectatorsAllowed(false);
        lobbyTester.setMaxPlayers(4);
        lobbyTester.setUsers(users);
        lobbyTester.setHost(user1);
        lobbyTester.setLeader(user1);
        lobbyService.save(lobbyTester);

        user1.setCharacter(characterService.findCharacterById(2).get());
        user2.setCharacter(characterService.findCharacterById(4).get());

        gameTester = gameService.createFromLobby(lobbyTester);
        user1.setLobby(lobbyTester);
        playerTester = gameTester.getPlayers().get(0);
    }

    @AfterEach
    public void teardown() {
        gameService.delete(gameTester);
    }
    
}
