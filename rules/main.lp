% ip-law — 知识产权保护规则
% Based on Chinese IP Law

% 知识产权保护判断
ip_protected(Owner, IP) :-
    ip_right(Owner, IP, Type),
    registered(IP),
    not expired(IP).

% 专利侵权
ip_infringement(P, Owner, IP) :-
    ip_protected(Owner, IP),
    ip_right(Owner, IP, patent),
    manufactures(P, Product),
    uses_patent(Product, IP),
    not licensed(P, IP).

% 商标侵权
ip_infringement(P, Owner, IP) :-
    ip_protected(Owner, IP),
    ip_right(Owner, IP, trademark),
    uses_mark(P, Mark),
    similar_mark(Mark, IP),
    not licensed(P, IP).
