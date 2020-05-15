import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import {Product} from "./Product";

@Entity()
export class Producer{
    @PrimaryGeneratedColumn()
    id: number;

    @Column("nvarchar")
    name: string;

    @OneToMany(type => Product, product => product.producer)
    products: Product[];
}