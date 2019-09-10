INSERT INTO `admin_organ`(`id`, `name`, `status`, `create_at`, `update_at`) 
VALUES (100, '默认组织机构', 'NORMAL', '2019-09-06 18:14:59', '2019-09-06 18:14:59');

INSERT INTO `admin_user`(`id`, `user_name`, `nick_name`, `password`, `email`, `mobile`, `gender`, `status`, `birthday`, `create_at`, `update_at`, `avatar`, `organ_id`) 
VALUES (1, 'root', '终极管理员', '$2a$10$XwqGezvGHl13IE1gzu43iud1LuEzIKo6FMhsm4C9U8J1IJjx5BpYK', 'test@test.com', '1234567asdf', 'SEX_MALE', 'NORMAL', '2016-07-18', '2019-04-02 11:07:29', '2019-06-14 16:51:17', 'http://p.qlogo.cn/bizmail/UdBmHq97ma4qOUG0OCNLjf0vasbVurrjPJO0yEK0TSTHQ1ibkaH9ttg/0', 0);

