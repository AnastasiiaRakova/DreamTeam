USE DreamTeam

select �����, ����
from �������

select �����, ����
from �����


select avg(ֳ��)
from ֳ��

select min(ֳ��)
from �������


select max(����������) 
from �����

select count(������) 
from �����������
where �����������>29


select distinct �����, ֳ��
from ³��
where ֳ�� between 65 and 130
order by ֳ�� desc

select �����_������, ֳ��
from ֳ��
where ֳ�� in (120, 125)
order by ֳ��


select �����,����, ֳ��
from ������� where ֳ�� < (select avg(ֳ��) from �������)

select �����, �������
from ������������� where ������� = (select ������� from ������������� where ������� like '%5%')


select �����.�����, �����.�����, �����.����
from ����� inner join ����� on �����.�����_id = �����.id

select �����.�����, �������.�����
from ������� inner join ����� on �������.�����_id = �����.id
where �����.�������˳������������ = '�������'