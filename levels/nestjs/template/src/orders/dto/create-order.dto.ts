import { IsInt, IsString, Min, MinLength } from 'class-validator';

export class CreateOrderDto {
  @IsInt()
  userId: number;

  @IsString()
  @MinLength(1)
  item: string;

  @IsInt()
  @Min(1)
  qty: number;
}
