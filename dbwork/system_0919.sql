-- system �������� ������ ������ Ȯ���ϱ�, ���ٸ� ���� : ctrl+enter
select username,account_status from dba_users;  -- user��, ��ݻ������� Ȯ��

--scott ������ ��ݻ��·� �����غ���
alter user scott account lock;

--scott ������ lock �� Ǯ���
alter user scott account unlock;

-- angel ������ ������(��� a1234)
create user angel IDENTIFIED by a1234;  --���� ����, ���� c## �� �ٿ��߸� �Ѵ�
create user c##angel IDENTIFIED by a1234; --���������� ����

-- ������ ������ �����Ϸ���
drop user c##angel;

-- c## �� �Ⱥ��̰� ������ �����Ϸ��� ������ �������� �����ؾ߸� �Ѵ�
alter session set "_ORACLE_SCRIPT"=true;
create user angel IDENTIFIED by a1234;

-- ������ ��߸� ���Ӱ� ����Ÿ������ �����ϴ�
grant connect,resource to angel;

-- angel �� ���̺��� �����Ҽ� �ֵ��� tablespace ���
alter user angel default tablespace users quota unlimited on users;