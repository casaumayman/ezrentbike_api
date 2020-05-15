import { Entity, PrimaryGeneratedColumn, Column, OneToMany, BaseEntity } from "typeorm";
import { Product } from "./Product";

@Entity()
export class Category extends BaseEntity{
    @PrimaryGeneratedColumn()
    id: number;

    @Column("nvarchar")
    name: string;

    @OneToMany(type => Product, product => product.category)
    products: Product[];
}