create table users
(
	id_usuario serial primary key,
	nome_usuario varchar(255),
	senha_usuario varchar(255),
	email_usuario varchar(255),
	data_criacao timestamp,
	ultimo_login timestamp	
)

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

alter table clientes
    owner to {current_owner};

create table produtos
(
    id_produto   serial
        primary key,
    nome_produto varchar(100),
    descricao    text,
    url_foto     varchar(300),
    preco        numeric(10, 2)
);

alter table produtos
    owner to {current_owner};

create table orcamentos
(
    id_orcamento        serial
        primary key,
    data_criacao        varchar(45),
    valor_total         numeric(10, 2),
    observacoes         text,
    clientes_id_cliente integer not null
        constraint fk_orcamentos_clientes
            references clientes
);

alter table orcamentos
    owner to {current_owner};

create index fk_orcamentos_clientes_idx
    on orcamentos (clientes_id_cliente);

create table itens_orcamento
(
    id_itens_orcamento      serial
        primary key,
    produtos_id_produto     integer not null
        constraint fk_itens_orcamento_produtos1
            references produtos,
    orcamentos_id_orcamento integer not null
        constraint fk_itens_orcamento_orcamentos1
            references orcamentos
);

alter table itens_orcamento
    owner to neondb_owner;

create index fk_itens_orcamento_produtos1_idx
    on itens_orcamento (produtos_id_produto);

create index fk_itens_orcamento_orcamentos1_idx
    on itens_orcamento (orcamentos_id_orcamento);

create table config_pdf
(
    idconfig_pdf serial
        primary key
);

alter table config_pdf
    owner to {current_owner};
