<?php
/**
 * Calm Night — PHP sample (WooCommerce / PhpStorm).
 */
declare(strict_types=1);

namespace Phoenix\Payments;

const MAX_RETRIES = 3;

enum ChargeStatus: string
{
    case Pending  = 'pending';
    case Approved = 'approved';
    case Declined = 'declined';
}

final class BillingService
{
    public function __construct(
        private readonly Gateway $gateway,
    ) {}

    // Charge in integer cents; retry transient failures.
    public function charge(string $customerId, int $amount): Charge
    {
        if ($amount <= 0) {
            throw new \InvalidArgumentException("invalid amount: {$amount}");
        }

        for ($attempt = 1; $attempt <= MAX_RETRIES; $attempt++) {
            try {
                return $this->gateway->submit($customerId, $amount);
            } catch (GatewayException $e) {
                usleep($attempt * 100_000);
            }
        }

        throw new \RuntimeException('gateway unavailable after retries');
    }
}
