import {Entity, PrimaryGeneratedColumn, Column} from 'typeorm';
@Entity()

export class Profile {
    @PrimaryGeneratedColumn()
    id: number;

    @Column("nvarchar")
    name: string;

    @Column()
    email: string;

    @Column()
    phoneNumber: string;

    @Column("nvarchar")
    address: string;

    @Column({
        nullable: true
    })
    avatar: string;
}