import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from "typeorm";
import { Product } from "./Product";

@Entity()
export class Event{
    @PrimaryGeneratedColumn()
    id: number;

    @Column("nvarchar")
    title: string;

    @Column("text")
    content: string;

    @Column("datetime")
    startTime: string;

    @Column("datetime")
    endTime: string;

    @Column({nullable: true})
    type: number;

    @Column()
    isPercent: boolean;

    @Column()
    value: number;

    @ManyToMany(type => Product, product => product.events)
    products: Product[];
}