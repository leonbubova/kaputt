import { Test } from '@nestjs/testing';
import { NotFoundException } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { UsersService } from '../users/users.service';

describe('OrdersService', () => {
  let service: OrdersService;
  const usersMock = { exists: (id: number) => id === 1 };

  beforeEach(async () => {
    const module = await Test.createTestingModule({
      providers: [OrdersService, { provide: UsersService, useValue: usersMock }],
    }).compile();
    service = module.get(OrdersService);
  });

  it('lists seeded orders', () => {
    expect(service.findAll().length).toBeGreaterThan(0);
  });

  it('creates an order for an existing user', () => {
    const order = service.create({ userId: 1, item: 'cable', qty: 3 });
    expect(order.id).toBeDefined();
    expect(service.findOne(order.id).item).toBe('cable');
  });

  it('rejects an order for an unknown user', () => {
    expect(() => service.create({ userId: 99, item: 'cable', qty: 1 })).toThrow(NotFoundException);
  });

  it('counts orders per user', () => {
    expect(service.countForUser(1)).toBe(2);
  });
});
