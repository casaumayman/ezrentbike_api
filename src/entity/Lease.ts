import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, ManyToOne } from "typeorm";
import { Product } from "./Product";
import { Account } from "./Account";

@Entity()
export class Lease{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    startTime: string;

    @Column()
    endTime: string;

    @ManyToOne(type => Product, product => product.leases)
    product: Product;

    @ManyToOne(type => Account, account => account.leases)
    account: Account;
}