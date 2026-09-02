import { Body, Controller, Get, Param, ParseIntPipe, Post } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { OrdersService } from './orders.service';

@Controller('orders')
export class OrdersController {
  constructor(private readonly orders: OrdersService) {}

  @Get()
  findAll() { return this.orders.findAll(); }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) { return this.orders.findOne(id); }

  @Post()
  create(@Body() dto: CreateOrderDto) { return this.orders.create(dto); }
}
