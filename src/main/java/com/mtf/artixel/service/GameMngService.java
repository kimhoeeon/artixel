package com.mtf.artixel.service;

import com.mtf.artixel.mapper.GameMngMapper;
import com.mtf.artixel.vo.GameVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GameMngService {

    private final GameMngMapper gameMngMapper;

    public List<GameVO> getGameList(String yearMonth) {
        return gameMngMapper.selectGameListByMonth(yearMonth);
    }

    public GameVO getGame(Long gameId) {
        return gameMngMapper.selectGameById(gameId);
    }

    @Transactional
    public void saveGame(GameVO game) {
        if (game.getGameId() == null) {
            gameMngMapper.insertGame(game);
        } else {
            gameMngMapper.updateGame(game);
        }
    }

    @Transactional
    public void deleteGame(Long gameId) {
        gameMngMapper.deleteGame(gameId);
    }
}