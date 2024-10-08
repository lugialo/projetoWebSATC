create table clientes
(
    id_cliente   serial
        primary key,
    nome_cliente varchar(100),
    email        varchar(100),
    telefone     varchar(15),
    endereco     varchar(255),
    data_nasc    date
);

create table orcamentos
(
    id_orcamento        serial
        primary key,
    data_criacao        varchar(45),
    valor_total         numeric(10, 2),
    observacoes         text,
    clientes_id_cliente integer      not null
        constraint fk_orcamentos_clientes
            references clientes,
    nome_orcamento      varchar(255) not null,
    status_orcamento    char         not null
);

create table produtos
(
    id_produto              serial
        primary key,
    nome_produto            varchar(100),
    preco                   numeric(10, 2),
    orcamentos_id_orcamento integer
        constraint fk_produtos_orcamentos
            references orcamentos
);

create index fk_orcamentos_clientes_idx
    on orcamentos (clientes_id_cliente);

create table config_pdf
(
    idconfig_pdf serial
        primary key
);

create table users
(
    id_usuario    serial
        primary key,
    nome_usuario  varchar(255),
    senha_usuario varchar(255),
    email_usuario varchar(255),
    data_criacao  timestamp,
    ultimo_login  timestamp
);

