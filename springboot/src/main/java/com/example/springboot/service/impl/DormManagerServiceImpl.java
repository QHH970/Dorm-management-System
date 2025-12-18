package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.DormBuild;
import com.example.springboot.entity.DormManager;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.DormManagerMapper;
import com.example.springboot.service.DormBuildService;
import com.example.springboot.service.DormManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service
@Transactional(rollbackFor = Exception.class)
public class DormManagerServiceImpl extends ServiceImpl<DormManagerMapper, DormManager> implements DormManagerService {

    /**
     * 注入DAO层对象
     */
    @Resource
    private DormManagerMapper dormManagerMapper;

    @Autowired
    private DormBuildService dormBuildService;

    /**
     * 宿管登录
     */
    @Override
    public DormManager dormManagerLogin(String username, String password) {
        QueryWrapper<DormManager> qw = new QueryWrapper<>();
        qw.eq("username", username);
        qw.eq("password", password);
        DormManager dormManager = dormManagerMapper.selectOne(qw);
        if (dormManager != null) {
            return dormManager;
        } else {
            return null;
        }
    }

    /**
     * 宿管新增
     */
    @Override
    public int addNewDormManager(DormManager dormManager) {
        int insert = dormManagerMapper.insert(dormManager);
        return insert;
    }

    /**
     * 宿管列表查询
     */
    @Override
    public Page find(Integer pageNum, Integer pageSize, String search) {
        List<DormBuild> buildList = dormBuildService.list();


        Page page = new Page<>(pageNum, pageSize);
        QueryWrapper<DormManager> qw = new QueryWrapper<>();
        qw.like("name", search);
        Page dormManagerPage = dormManagerMapper.selectPage(page, qw);
        List<DormManager> records = dormManagerPage.getRecords();
        if(buildList.size() > 0){
            Map<Integer, String> buildMap = buildList.stream().collect(Collectors.toMap(DormBuild::getDormBuildId, DormBuild::getDormBuildName));
            for (DormManager record : records) {
                record.setDormBuildName(buildMap.get(record.getDormBuildId()));
            }
        }
        return dormManagerPage;
    }

    /**
     * 宿管信息更新
     */
    @Override
    public int updateNewDormManager(DormManager dormManager) {
        DormManager query = dormManagerMapper.selectById(dormManager.getUsername());
        if(query.getDormBuildId() != dormManager.getDormBuildId()){
            List<DormManager> dormManagers = dormManagerMapper.selectList(new QueryWrapper<DormManager>().eq("dormbuild_id", dormManager.getDormBuildId()));
            if (dormManagers.size() > 0){
                throw new ServiceException("该宿舍楼已经被接管，请重新选择");
            }
        }
        int i = dormManagerMapper.updateById(dormManager);
        return i;
    }

    /**
     * 宿管删除
     */
    @Override
    public int deleteDormManager(String username) {
        int i = dormManagerMapper.deleteById(username);
        return i;
    }


}
