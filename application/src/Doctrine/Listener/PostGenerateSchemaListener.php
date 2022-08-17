<?php

declare(strict_types=1);

namespace App\Doctrine\Listener;

use Doctrine\DBAL\Exception;
use Doctrine\DBAL\Schema\AbstractSchemaManager;
use Doctrine\DBAL\Schema\PostgreSQLSchemaManager;
use Doctrine\DBAL\Schema\SchemaException;
use Doctrine\ORM\Tools\Event\GenerateSchemaEventArgs;

final class PostGenerateSchemaListener
{
    /**
     * @throws Exception
     * @throws SchemaException
     */
    public function postGenerateSchema(GenerateSchemaEventArgs $args): void
    {
        /**
         * @var AbstractSchemaManager $schemaManager
         */
        $schemaManager = $args
            ->getEntityManager()
            ->getConnection()
            ->createSchemaManager()
        ;

        if (!$schemaManager instanceof PostgreSQLSchemaManager) {
            return;
        }

        $schema = $args->getSchema();

        foreach ($schemaManager->listSchemaNames() as $namespace) {
            if (!$schema->hasNamespace($namespace)) {
                $schema->createNamespace($namespace);
            }
        }
    }
}