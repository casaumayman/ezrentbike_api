import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany, ManyToMany, JoinTable } from "typeorm";
import {Producer} from "./Producer";
import { Category } from "./Category";
import { Lease } from "./Lease";
import { Event } from "./Event";

@Entity()
export class Product{
    @PrimaryGeneratedColumn()
    id: number;

    @Column("nvarchar")
    name: string;

    @Column("text")
    description: string;

    @Column()
    cost: number;

    @Column()
    image: string;

    @OneToMany(type => Lease, lease => lease.product)
    leases: Lease[];

    @ManyToOne(type => Producer, producer => producer.products)
    producer: Producer;

    @ManyToOne(type => Category, category => category.products)
    category: Category;

    @ManyToMany(type => Event,  event => event.products)
    @JoinTable()
    events: Event[];
}