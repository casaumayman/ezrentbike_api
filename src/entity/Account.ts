import {Entity, PrimaryGeneratedColumn, OneToOne, JoinColumn, Column, OneToMany, BeforeInsert} from 'typeorm';
import {Profile} from './Profile';
import {Feedback} from "./Feedback";
import { Lease } from './Lease';

@Entity()
export class Account {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    username: string;

    @Column()
    password: string;
    @Column({type: "int"})
    role: number;

    @Column({nullable: true, type: 'longtext'})
    token: string;

    @OneToOne(type => Profile)
    @JoinColumn()
    profile: Profile;

    @OneToMany(type => Feedback, feedback => feedback.account)
    feedbacks: Feedback[];

    @OneToMany(type => Lease, lease => lease.account)
    leases: Lease[];
}