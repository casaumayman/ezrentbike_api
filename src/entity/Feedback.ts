import {Entity, PrimaryGeneratedColumn, Column, ManyToOne} from "typeorm";
import {Account} from "./Account";

@Entity()
export class Feedback{
    @PrimaryGeneratedColumn('uuid')
    id: string;
    
    @Column("longtext")
    content: string;

    @ManyToOne(type => Account, Account => Account.feedbacks)
    account: Account;
}